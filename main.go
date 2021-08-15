package main

import (
	"fmt"
	"os"
)

func main() {
    fmt.Println("Welcome to the SpaceBusOS installer!")

	if os.Geteuid() == 0{
		fmt.Println("Avoid running the SpaceBusOS installer as Root!")
        os.exit(0)
	}



}
