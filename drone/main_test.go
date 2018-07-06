package main

import "testing"

func TestGreeting(t *testing.T) {
	greeting := "Hello"
	expected := "Hello"
	if greeting != expected {
		t.Errorf("Greeting was incorrect, got: %s, want: %s.", greeting, expected)
	}
}
