from importlib import metadata

try:
    __version__ = metadata.version("audion")
except metadata.PackageNotFoundError:
    __version__ = "0.1.0"
