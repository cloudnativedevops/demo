package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"gopkg.in/yaml.v2"
)

const cfgPath = "/config/demo.yaml"

var config struct {
	Greeting string
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "%s, 世界\n", config.Greeting)
}

func main() {
	cfgData, err := ioutil.ReadFile(cfgPath)
	if err != nil {
		log.Fatal(err)
	}
	if err = yaml.Unmarshal(cfgData, &config); err != nil {
		log.Fatalf("failed to parse config file %q: %v", cfgPath, err)
	}
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8888", nil))
}
