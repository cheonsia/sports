import oracledb
import pandas as pd
from matplotlib import pyplot as plt
#한글 지정
plt.rcParams['font.family'] ='Malgun Gothic'
plt.rcParams['axes.unicode_minus'] =False

oracledb.init_oracle_client(lib_dir="C:\\mbc6\\python\\db\\instantclient_11_2") #오라클 라이브러리 경로가 들어감
connect = oracledb.connect(user='csa', password='1234',dsn='localhost')
c=connect.cursor() #오라클 DB 쿼리문

c.execute("select team,count(team) from sportsmember where sport='야구' group by team order by team")
soccer=c.fetchall()
steam=[]
slike=[]
for i in soccer:
    steam.append(i[0])
    slike.append(i[1])

fig=plt.figure(figsize=(8,5))
ax=fig.add_subplot(1,1,1)
autotexts=plt.title('야구 팀 선호표')
color=['#E60D2C70','#00000070','#C20E5370','#30528870','#CE132D70','#13132F70','#11204070','#0066B370','#67001870','#F3732170']

plt.pie(slike,labels=steam,
        colors=color,
        wedgeprops = {'width':0.7,'edgecolor':'w','linewidth':3},
        autopct='%.1f%%', pctdistance=0.8)

plt.legend(loc=1,ncol=1,bbox_to_anchor=(1.4,1.1))

plt.show()
