package main

import "github.com/kingjan1999/transfer.sh-1/cmd"

func main() {
	app := cmd.New()
	app.RunAndExitOnError()
}
