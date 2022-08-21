import requests
import json

# 2. 요청 보낼 url 주소
url = "https://e243-1-209-192-229.jp.ngrok.io/buy_land/"

# 3. 같이 보낼 데이터 작성
data = {"id": 1, "nft":"tasdfa5456lsjlkhajvn12asd"}

# 4. post로 API서버에 요청보내기
res = requests.post(url, data=json.dumps(data))

# 5. 결과 확인하기
print(res.text)