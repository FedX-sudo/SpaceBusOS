package main

import (
	"fmt"
	"os"
    "os/exec"
    "flag"
    "toml"
)
// this is a function to test weather a command exists or not.
func isCommandAvailable(name string) bool {
      cmd := exec.Command("command", "-v", name)
      if err := cmd.Run(); err != nil {
              return false
      }
      return true
}

func main() {
    var conf Config
    if _, err := toml.Decode(tomlData, &conf); err != nil {
    // handle error
    }
    fmt.Println(conf)
    var (
        err error

    )
    fmt.Println("Welcome to the SpaceBusOS installer! Currently this is NON FUNCTINAL!")

    //This is checking wheather the installer is running as root or not, it probably is fine, but best to play it safe.
	if os.Geteuid() == 0{
		fmt.Println("Avoid running the SpaceBusOS installer as Root!")
        os.Exit(1)
	}

    //This is checking wheather /bedrock exists or not. Probably a bad way of doing it, but it gets the job done.
    if isCommandAvailable("brl"){
        fmt.Println("Bedrock Linux is already installed.")
        // this is testing the version of Bedrock Linux.


        if exec.Command("brl version").String() != "Bedrock Linux 0.7.22 Poki" {
            fmt.Println("Bedrock Linux is not up to date, updating.")
            out, err := exec.Command("sudo brl update").Output()
            fmt.Println(out)
        }
    }else {
        fmt.Println("Bedrock has not been installed, starting the install prossess")

    }


}
