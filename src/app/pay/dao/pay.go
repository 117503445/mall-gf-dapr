// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"117503445/mall-gf-dapr/app/pay/dao/internal"
)

// internalPayDao is internal type for wrapping internal DAO implements.
type internalPayDao = *internal.PayDao

// payDao is the data access object for table pay.
// You can define custom methods on it to extend its functionality as you wish.
type payDao struct {
	internalPayDao
}

var (
	// Pay is globally public accessible object for table pay operations.
	Pay = payDao{
		internal.NewPayDao(),
	}
)

// Fill with you ideas below.