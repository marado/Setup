#!/usr/bin/env python

import asyncore
from email import message_from_string
from smtpd import DebuggingServer


class PrettyDebugginServer(DebuggingServer):

    def process_message(self, peer, mailfrom, rcpttos, data):
        print '---------- MESSAGE FOLLOWS ----------'
        message = message_from_string(data)

        print message.as_string().replace('=\n', '')
        print '------------ END MESSAGE ------------'

if __name__ == '__main__':

    server = PrettyDebugginServer(
        ('localhost', 1025),
        ('localhost', 8025),
        )

    try:
        asyncore.loop()
    except KeyboardInterrupt:
        pass
