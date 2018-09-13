package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	magicWord := os.Getenv("MAGIC_WORD")
	fmt.Fprintf(w, "The magic word is %q", magicWord)
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8888", nil))
}
