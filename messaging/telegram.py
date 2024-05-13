import argparse
import os

import requests

TELEGRAM_TOKEN = os.environ["TELEGRAM_TOKEN"]
TELEGRAM_CHAT_ID = os.environ["TELEGRAM_CHAT_ID"]


def send_message(message: str, token: str, chat_id: str):
    request_str = f"https://api.telegram.org/bot{token}/sendMessage?chat_id={chat_id}"
    requests.post(request_str, json={"text": message}, timeout=1)


parser = argparse.ArgumentParser()
parser.add_argument("message", type=str)
parser.add_argument("--token", type=str, required=False, default=TELEGRAM_TOKEN)
parser.add_argument("--chat_id", type=str, required=False, default=TELEGRAM_CHAT_ID)

if __name__ == "__main__":
    args = parser.parse_args()
    send_message(args.message, args.token, args.chat_id)
