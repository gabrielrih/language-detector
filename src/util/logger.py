import logging
import logging.config

import src.env as envs


class Logger:
    @staticmethod
    def get(name):
        logger = logging.getLogger(name)
        logger.setLevel(level=envs.LOG_LEVEL)
        handler = logging.StreamHandler()
        handler.setLevel(envs.LOG_LEVEL)
        formatter = logging.Formatter(
            "%(asctime)s %(levelname)s [%(name)s] [%(filename)s:%(lineno)d] - %(message)s"
        )
        handler.setFormatter(formatter)
        logger.addHandler(handler)
        return logger
