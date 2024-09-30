package blog

import (
	"std"
	
	"gno.land/p/demo/role_manager"
)

const (
	ADMIN_ROLE = "admin"
	MODERATOR_ROLE = "moderator"
)

const (
	LOCK_QUESTION_PERM = "lock:question"
	RESOLVE_QUESTION_PERM = "resolve:question"
)


func init() {
	rm = role_manager.NewWithAddress(std.PrevRealm().Addr())

	// Define moderator role.
	rm.NewPermission(LOCK_QUESTION_PERM)
	rm.NewPermission(RESOLVE_QUESTION_PERM)

	rm.NewRole(MODERATOR_ROLE, []string{RESOLVE_QUESTION_PERM}, role_manager.ROLE_USER)

	// Define admin role.
	rm.NewRole(ADMIN_ROLE, []string{role_manager.PERM_ALL}, MODERATOR_ROLE)
	rm.AddRoleToUser(ADMIN_ROLE, std.Address("g1ld6uaykyugld4rnm63rcy7vju4zx23lufml3jv"))
}

func SetModerator(moderator std.Address) {
	rm.AddRoleToUser(MODERATOR_ROLE, moderator)
}

func RemoveModerator(moderator std.Address) {
	rm.RemoveRoleFromUser(MODERATOR_ROLE, moderator)
}