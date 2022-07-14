// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// Pay is the golang structure for table pay.
type Pay struct {
	Id         uint64      `json:"id"         ` //
	CreatedAt  *gtime.Time `json:"createdAt"  ` //
	UpdatedAt  *gtime.Time `json:"updatedAt"  ` //
	DeletedAt  *gtime.Time `json:"deletedAt"  ` //
	ConsumerId string      `json:"consumerId" ` // 消费者的 UUID | "44ec60c4-1434-47a6-a9c2-443eb1ac27c8"
	OrderId    uint64      `json:"orderId"    ` // 订单 id
	Status     uint        `json:"status"     ` // 订单状态
}
