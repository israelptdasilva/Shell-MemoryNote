#!/bin/bash
source scripts/version

printf "\n"
printf "  Note, version %s\n" $VERSION
printf "  Author: %s\n" "$AUTHOR"
printf "  Description: %s\n\n" "$DESCRIPTION"
printf "  Usage: note {subcommand}\n\n"
printf "  Subcommands:\n"
printf "   - By default note creates a new note.\n"
printf "   - new: Creates a new note.\n"
printf "   - read: Reads a random note from the data folder.\n"
printf "\n"



