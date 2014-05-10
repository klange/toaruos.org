.PHONY: all

all: content/*
	pelican content -s config.py
