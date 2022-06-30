// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// Order is the golang structure of table order for DAO operations like Where/Data.
type Order struct {
	g.Meta     `orm:"table:order, do:true"`
	Id         interface{} //
	CreatedAt  *gtime.Time //
	UpdatedAt  *gtime.Time //
	DeletedAt  *gtime.Time //
	ConsumerId interface{} // 消费者的 UUID | "44ec60c4-1434-47a6-a9c2-443eb1ac27c8"
	ProductId  interface{} // 商品 id
	Amount     interface{} // 商品数量
}
