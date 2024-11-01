import oracledb
import pandas as pd
from matplotlib import pyplot as plt
import numpy as np
#한글 지정
plt.rcParams['font.family'] ='Malgun Gothic'
plt.rcParams['axes.unicode_minus'] =False

oracledb.init_oracle_client(lib_dir="instantclient_11_2 경로") #오라클 라이브러리 경로가 들어감
connect = oracledb.connect(user='오라클계정', password='오라클비번',dsn='localhost')
c=connect.cursor() #오라클 DB 쿼리문

c.execute("select case when 2024-substr(birth,0,4)+1 <20 then '10대' when 2024-substr(birth,0,4)+1 <30 then '20대' when 2024-substr(birth,0,4)+1 <40 then '30대'when 2024-substr(birth,0,4)+1 <50 then '40대'when 2024-substr(birth,0,4)+1 <60 then '50대'when 2024-substr(birth,0,4)+1 >70 then '60대 이상'end as age from sportsmember where sport='축구'")
k=c.fetchall()
age=['10대','20대','30대','40대','50대','60대 이상']
scount = [0,0,0,0,0,0]
for j in k:
    for i in range(0,len(age)):
        if j[0] == age[i] :
            scount[i] += 1   


c.execute("select case when 2024-substr(birth,0,4)+1 <20 then '10대' when 2024-substr(birth,0,4)+1 <30 then '20대' when 2024-substr(birth,0,4)+1 <40 then '30대'when 2024-substr(birth,0,4)+1 <50 then '40대'when 2024-substr(birth,0,4)+1 <60 then '50대'when 2024-substr(birth,0,4)+1 >70 then '60대 이상'end as age from sportsmember where sport='야구'")
k=c.fetchall()
bcount = [0,0,0,0,0,0]
for j in k:
    for i in range(0,len(age)):
        if j[0] == age[i] :
            bcount[i] += 1

            
fig=plt.figure(figsize=(10, 5))
ax=fig.add_subplot(1,1,1)
x = np.arange(len(age))  
width = 0.35  # 막대 너비 설정

# 막대 그래프 생성
rects1 = ax.bar(x - width/2, scount, width, label='축구', color='green', alpha=0.4)
rects2 = ax.bar(x + width/2, bcount, width, label='야구',color='brown', alpha=0.4) 

# 축 및 제목 설정
ax.set_xlabel('나이')
ax.set_ylabel('수')
ax.set_title('종목별 나이대 선호도')
ax.set_xticks(x)  # x축 눈금 위치 설정
ax.set_xticklabels(age)  # x축 눈금 레이블 설정 / rotation=45, ha='right' => 동 이름을 기울여서 출력
ax.legend()  # 범례 추가
##
plt.show()
