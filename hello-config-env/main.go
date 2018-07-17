package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	greeting := os.Getenv("GREETING")
	fmt.Fprintf(w, "%s, 世界\n", greeting)
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8888", nil))
}
