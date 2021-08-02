# 서울시 빅데이터 분석을 통한   
교통단속 CCTV 위치 추천 및 실시간 단속 Navigator   
------

분석 기간 : 2019년 10월 14일 ~ 2019년 11월 01일

팀 명 : 연합군

구성원 : 임슬기(팀장), 권지은, 심정현, 김지훈, 연제호

## 기획 의도

---
- 서울시 25구 중 불법 주정차 취약 1위 구인 강남구를 주 타겟으로 
- 강남구의 불법 주정차 취약 지역을 데이터 분석을 통해 도출하고, 그 중 교통 단속 CCTV가 설치되지 않은 지역에 설치 제안
- 불법 주정차 단속 데이터를 수집, 저장하여 단속 요원이 활용할 수 있는 시각화 서비스 제공

## 사용도구 및 분석환경

---
- 전처리 및 분석, 시각화 : Python 3.6.7, R, Excel, QGIS 3.8.3
- Web Server : Redis, Docker, Django, HTML5
- Data Collection Server : Flume, Hadoop, CentOS 7.6.1810(64bit), Virtual box VM
- 기타 사용 : Jupyter LAB 1.1.4, Winscp, Putty

![Untitled 8](https://user-images.githubusercontent.com/71672106/127818963-a2ddcf46-075d-4a72-b778-9119fb53811f.png)


## 분석 과정

---

- 교통 단속 CCTV 위치 추천, 실시간 단속 Navigator 분석 과정입니다.

![Untitled](https://user-images.githubusercontent.com/71672106/127818807-7b5b681f-0da8-4e12-a4da-b9a57e4655b7.png)

## 데이터 수집

---

- 주요 분석 활용 Dataset
- 서울 강남구 불법주정차 단속 현황 (2019.08~09 / 47,034건)
- 서울 강남구 CCTV 불법주정차 단속 현황 (2019.08~09 / 14,447건)
- 서울 강남구 어린이 보호구역 위치 (2018 / 103건)
- 서울 강남구 소방용수시설 위치 (2018 / 59,957건)
- 소상공인시장진흥공단_상가업소정보 (2018 / 564,975건)
- 서울 강남구 공영, 민영 주차장 (2018 / 52건)
- 서울시 버스정류장 위치 (2018 / 535건)
- 서울 횡단보도 현황 (2018 / 30,969건)
- 서울시 강남구 단속 투입인력현황

![Untitled 1](https://user-images.githubusercontent.com/71672106/127818659-aab4f6a6-ded6-4de9-9a4d-ab0dadf37325.png)


## 전처리 & 저장

---

- QGIS를 통해 500m 격자로 나눠 구역별 ID 부여 → 257개의 ID 생성
- 적절한 K개 선정 및 k-평균 군집화 진행

![Untitled 2](https://user-images.githubusercontent.com/71672106/127818748-c1a6f49c-9289-4f67-b413-fbd6ec22564e.png)

- 변수를 합친 데이터에 군집 Label을 부여함

![Untitled 3](https://user-images.githubusercontent.com/71672106/127818833-f6e67c45-4e94-49b4-a3ce-9bf3709d9097.png)

- T-test 진행

## 분석

---

- 1번 군집과 6번 군집의 경우 타 군집에 비해 CCTV 설치수가 적은 것을 확인하였습니다.
1, 6번 군집을 비교분석한 결과는 아래와 같습니다.
- 1번 군집 : 단속건수 많고, 교통 단속 CCTV가 없는 구역
- 6번 군집 : 단속건수 적고, 교통 단속 CCTV가 없는 구역

![Untitled 4](https://user-images.githubusercontent.com/71672106/127818849-6bbafb68-62d6-4318-bb48-1a69ba8bf594.png)

## 결과

---

- 1번 군집의 단속건수 상위 10에 CCTV 추가 설치가 필요하다는 결과를 도출해냈습니다.

![Untitled 5](https://user-images.githubusercontent.com/71672106/127818914-48918a89-8a1e-4a38-a0f5-7db14eb93911.png)

## 실시간 단속 Navigator

---

- 실시간 단속 Navigator는 불편 신고 앱을 통한 신고 데이터를 통해
지도 시각화, 분석결과를 제공합니다.

![Untitled 6](https://user-images.githubusercontent.com/71672106/127818939-339cfae7-f24b-41c9-917d-fc921299d447.png)

![Untitled 7](https://user-images.githubusercontent.com/71672106/127818945-14fb4a64-2018-43b6-a604-c401ee9936f5.png)


