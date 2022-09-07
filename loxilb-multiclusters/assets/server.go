package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

	})
	if err := http.ListenAndServe(":5001", nil); err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
