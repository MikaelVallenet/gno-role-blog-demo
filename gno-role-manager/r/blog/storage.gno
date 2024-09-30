package blog

import (
	"gno.land/p/demo/uintavl"
	"gno.land/p/demo/role_manager"
)

// Select uintavl.Tree methods (for convenience).
//
// func (tree *Tree) Size() int
// func (tree *Tree) Has(key uint64) (has bool)
// func (tree *Tree) Get(key uint64) (value interface{}, exists bool)
// func (tree *Tree) Set(key uint64, value interface{}) (updated bool)

// id (uint64) -> *Question
var questions uintavl.Tree
var rm *role_manager.RoleManager