package main

import (
	"errors"
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"
)

// represent the tree as an two dimensional array

// node represents one of the items in the triangle
type Node struct {
	// node value
	Val int
	// represents the max with this node and the L/R nodes below
	// -1 is a sentinel value to represent this hasn't been processed yet
	MaxVal int
}

type Tree [][]Node

// parse the data file into the Tree
func loadTree(path string) (*Tree, error) {
	// open file
	treeBytes, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}
	// parse into Tree
	var tree Tree
	for _, line := range strings.Split(strings.TrimSpace(string(treeBytes)), "\n") {
		var level []Node
		for _, nodeValue := range strings.Fields(strings.TrimSpace(line)) {
			nodeInt, _ := strconv.Atoi(nodeValue)
			level = append(level, Node{nodeInt, -1})
		}
		tree = append(tree, level)
	}
	return &tree, nil
}

// calculates the max value you can get for a particular X, Y position.
// if either of the children's max value hasn't been processed yet
// calls those first (which calls their children, recursively)
func calculateMaxValue(tree *Tree, x int, y int) (int, error) {
	if x >= len(*tree) {
		return 0, errors.New("reached the bottom of the tree")
	}
	// if this max value has already been calculated
	if (*tree)[x][y].MaxVal != -1 {
		return (*tree)[x][y].MaxVal, nil
	}
	leftVal, err := calculateMaxValue(tree, x+1, y)
	// check if we passed the bottom of the tree
	if err != nil {
		// return the current node Val (bottom row is the max val of itself)
		(*tree)[x][y].MaxVal = (*tree)[x][y].Val
		return (*tree)[x][y].Val, nil
	}
	rightVal, _ := calculateMaxValue(tree, x+1, y+1)
	// get max value
	childMaxVal := leftVal
	if rightVal > childMaxVal {
		childMaxVal = rightVal
	}
	// set the current node's max value
	(*tree)[x][y].MaxVal = childMaxVal + (*tree)[x][y].Val
	return (*tree)[x][y].MaxVal, nil
}

func main() {
	tree, err := loadTree("./data.txt")
	if err != nil {
		panic(err)
	}
	maxVal, _ := calculateMaxValue(tree, 0, 0)
	fmt.Printf("%d\n", maxVal)
}
