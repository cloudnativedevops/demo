package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

const secretPath = "/secrets/magicWord"

var magicWord []byte

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "The magic word is %q", magicWord)
}

func main() {
	var err error
	magicWord, err = ioutil.ReadFile(secretPath)
	if err != nil {
		log.Fatal(err)
	}
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8888", nil))
}
