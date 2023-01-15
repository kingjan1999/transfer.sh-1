package main

import (
	"log"
	"os"

	"github.com/kingjan1999/transfer.sh-1/cmd"
)

func main() {
	app := cmd.New()
	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
