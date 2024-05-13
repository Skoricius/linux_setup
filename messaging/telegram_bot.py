import telegram
import logging
import sys
from logging import Logger
from logging.handlers import BufferingHandler
from telegram import Update
from telegram.ext import Updater, MessageHandler, \
    Filters, CallbackContext, CommandHandler
import logging
from datetime import datetime
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    level=logging.INFO)

bot_token = "TOKEN"
chat_id_glados = "-1001158892332"
chat_id_potato = "952789835"


def create_updater_example():
    """Note: this runs PotatoGlados and can be interacted with.
    """
    def start(update: Update, context: CallbackContext):
        print(update.effective_chat.id)
        context.bot.send_message(
            chat_id=update.effective_chat.id, text="I'm a bot, please talk to me!")

    def time_update(update: Update, context: CallbackContext):
        time = str(datetime.now())
        context.bot.send_message(
            chat_id=update.effective_chat.id, text=time)

    def echo(update: Update, context: CallbackContext):
        context.bot.send_message(
            chat_id=update.effective_chat.id, text=update.message.text)
    updater = Updater(token=bot_token, use_context=True)
    dispatcher = updater.dispatcher

    start_handler = CommandHandler('start', start)
    update_handler = CommandHandler('update', time_update)
    dispatcher.add_handler(start_handler)
    dispatcher.add_handler(update_handler)

    echo_handler = MessageHandler(Filters.text & (~Filters.command), echo)
    dispatcher.add_handler(echo_handler)
    # updater.bot.send_message(updater.dispatcher., text)
    updater.start_polling()


BOT = telegram.Bot(token=bot_token)


def send_message(message, chat_id=chat_id_glados):
    BOT.send_message(chat_id=chat_id, text=message)


class BotHandler(BufferingHandler):
    def __init__(self, bot, chat_id=chat_id_glados, capacity=1):
        super().__init__(capacity)
        self.bot = bot
        self.chat_id = chat_id_glados
        self.level = logging.INFO

        # create formatter and add it to the handlers
        formatter = logging.Formatter(
            '%(asctime)s - %(levelname)s - %(message)s')
        self.setFormatter(formatter)

    def emit(self, record):
        msg = self.format(record)
        self.send_message(msg)

    def send_message(self, msg):
        try:
            self.bot.send_message(chat_id=self.chat_id, text=msg, timeout=0.1)
        except:
            pass


class BotLogger(Logger):
    def __init__(self, bot=None, stdout_print=True):
        if bot is None:
            bot = BOT
        self.bot = bot
        Logger.__init__(self, 'botlogger')
        self.setLevel(logging.INFO)
        self.addHandler(BotHandler(BOT))
        if stdout_print:
            self.addHandler(logging.StreamHandler(sys.stdout))

    def get_last_message(self):
        updates = self.bot.get_updates()
        text = updates[-1].effective_message.text
        return text


if __name__ == "__main__":

    # create_updater_example()
    send_message("Process done!", chat_id=chat_id_potato)
