import subprocess
import re
from telegram import Update
from telegram.ext import Updater, CommandHandler, CallbackContext, MessageHandler, Filters

# Обработчик команды /eventlog
def eventlog_command(update: Update, context: CallbackContext):
    # Отправляем сообщение с запросом имени журнала событий
    update.message.reply_text("Введите имя журнала событий:")

    # Устанавливаем состояние "ожидание имени журнала"
    context.user_data['state'] = 'awaiting_logname'


# Обработчик текстовых сообщений
def handle_text(update: Update, context: CallbackContext):
    if 'state' not in context.user_data:
        # Если состояние не установлено, пропускаем сообщение
        return

    state = context.user_data['state']

    if state == 'awaiting_logname':
        # Получаем введенное имя журнала событий
        event_log_name = update.message.text

        # Отправляем сообщение с запросом количества событий
        update.message.reply_text("Введите количество событий для вывода:")

        # Сохраняем имя журнала в состоянии
        context.user_data['event_log_name'] = event_log_name
        context.user_data['state'] = 'awaiting_event_count'

    elif state == 'awaiting_event_count':
        # Получаем введенное количество событий
        event_count = update.message.text

        # Удаляем состояние
        del context.user_data['state']

        try:
            # PowerShell команда для выполнения
            powershell_command = f'Get-EventLog -LogName {context.user_data["event_log_name"]} -Newest {event_count}'

            # Выполнение команды PowerShell
            result = subprocess.run(['powershell.exe', '-Command', powershell_command], capture_output=True, text=True)

            # Проверка на наличие ошибок
            if result.returncode != 0:
                update.message.reply_text('Произошла ошибка:')
                update.message.reply_text(result.stderr)
            else:
                # Обработка вывода
                events = result.stdout.splitlines()
                events = [event.strip() for event in events if event.strip()]

                for event in events:
                    match = re.match(r"(\d+) (\w+ \d+ \d+:\d+) +(\w+)\s+(.+)", event)
                    if match:
                        index = match.group(1)
                        date = match.group(2)
                        entry_type = match.group(3)
                        details = match.group(4).strip()
                        details_match = re.match(r"(.*?)\s+(\d+) (.+)", details)
                        if details_match:
                            source = details_match.group(1)
                            instance_id = details_match.group(2)
                            message = details_match.group(3)
                            formatted_event = f"Index: {index} | Date: {date} | EntryType: {entry_type} | Source: {source} | InstanceID: {instance_id} | Message: {message}"
                            update.message.reply_text(formatted_event, disable_web_page_preview=True)
                        else:
                            update.message.reply_text(event, disable_web_page_preview=True)
                    else:
                        update.message.reply_text(event, disable_web_page_preview=True)


        except Exception as e:
            update.message.reply_text('Произошла ошибка:')
            update.message.reply_text(str(e))


def main():
    # Инициализация бота
    updater = Updater("5997303848:AAEZt32VfhOyJ_kGe_KWdYGnBDx-0vY3gYI", use_context=True)

    # Получение диспетчера обновлений
    dispatcher = updater.dispatcher

    # Регистрация обработчиков
    dispatcher.add_handler(CommandHandler("eventlog", eventlog_command))
    dispatcher.add_handler(MessageHandler(Filters.text, handle_text))

    # Запуск бота
    updater.start_polling()
    updater.idle()


if __name__ == '__main__':
    main()
