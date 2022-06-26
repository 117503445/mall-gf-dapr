package utility

import (
	"context"
	"database/sql"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
)

// InitDB init Database with sql
func InitDB(ctx context.Context) {
	sqlPathListVar, err := g.Cfg().Get(ctx, "database.sqlOnBoot")
	if err == nil {
		sqlPathList := sqlPathListVar.Strings()
		if len(sqlPathList) > 0 {
			link := g.DB().GetConfig().Link + "?multiStatements=true"
			g.Log().Line(true).Debugf(ctx, "create new db link: %v", link)

			db, err := sql.Open("mysql", link)
			if err != nil {
				panic(err)
			}
			defer db.Close()

			for _, sqlPath := range sqlPathList {
				g.Log().Line(true).Debugf(ctx, "exec sql: %v", sqlPath)
				sql := gfile.GetContents(sqlPath)
				_, err := db.Exec(sql)
				if err != nil {
					panic(err)
				}
			}
		}
	}
}
