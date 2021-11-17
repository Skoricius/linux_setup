import telegram
import logging
import sys
from logging import Logger
from logging.handlers import BufferingHandler

bot_token = "TOKEN"
BOT = telegram.Bot(token=bot_token)


def send_message(message, chat_id="-1001158892332"):
    BOT.send_message(chat_id=chat_id, text=message)


class BotHandler(BufferingHandler):
    def __init__(self, bot, chat_id="-1001158892332", capacity=1):
        super().__init__(capacity)
        self.bot = bot
        self.chat_id = "-1001158892332"
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
    send_message("Process done!")
