import logging
from inspect import FrameInfo


def log_exception(exception: Exception, frame_info: FrameInfo, level=logging.ERROR):
    logging.log(
        level,
        " ".join([type(exception).__name__, frame_info.filename, frame_info.function]),
    )
