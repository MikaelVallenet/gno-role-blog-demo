package blog

import "std"

func LockQuestion(id uint64) {
	caller := std.PrevRealm().Addr()

	// Check if the caller has the permission to lock the question.
	if !rm.UserHasPermission(caller, LOCK_QUESTION_PERM) {
		panic("caller does not have permission to lock question")
	}

	question := getQuestion(id)
	question.IsLocked = true
}

func UnlockQuestion(id uint64) {
	caller := std.PrevRealm().Addr()

	// Check if the caller has the permission to unlock the question.
	if !rm.UserHasPermission(caller, LOCK_QUESTION_PERM) {
		panic("caller does not have permission to unlock question")
	}

	question := getQuestion(id)
	question.IsLocked = false
}