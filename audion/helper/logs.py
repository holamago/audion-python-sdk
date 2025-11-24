#!/usr/bin/env python
# encoding: utf-8
# Copyright (c) 2025- SATURN2
# AUTHORS
# Sukbong Kwon (Galois)

import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s.%(msecs)03d: %(name)-10s: %(levelname)s: %(funcName)s(): %(message)s",
    datefmt="%Y-%m-%d %p %I:%M:%S",
)


def get_logger(
    name: str,
    level: str = "INFO",
) -> logging.Logger:
    """Get configured logger for the given module name.

    Args:
        name: Name of module.
        level: Logging level name (e.g. \"DEBUG\", \"INFO\").

    Returns:
        logging.Logger: Configured logger instance.
    """
    logger = logging.getLogger(name.split(".")[-1])

    # Set logging level from string
    level = level.upper()
    if hasattr(logging, level):
        logger.setLevel(getattr(logging, level))
    else:
        logger.setLevel(logging.INFO)

    return logger


