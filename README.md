분석 기간 : 2019년 10월 14일 ~ 2019년 11월 01일

# 주제 선정 이유

---

- 현재 서울시에서 불법주정차 감소 정책 (단속 기동반, CCTV, 생활불편 App 신고)을 시행하고 있지만 매년 증가
- 4년동안 전국적으로 불법주정차 연계형 사고 손실금액은 약 2,200억
- 서울 25개 구 중 불법 단속 건수, 서울 사업체, 종사자 수 1위인 강남구를 선정하여, 분석 진행함

# 분석 방향

---

- 공공데이터를 활용한 CCTV 취약 지역에 추가 배치 제안
- 실시간 불법 주정차 신고 데이터 분석 시스템을 통한
단속 지역 추천 대시보드 제공

# 분석 과정

---

- 교통 단속 CCTV 위치 추천, 실시간 단속 Navigator 분석 과정입니다.

    ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec682ea3-8c82-47f1-8e74-e997ca6f6077/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec682ea3-8c82-47f1-8e74-e997ca6f6077/Untitled.png)

# 데이터 수집

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

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02e832c5-fda1-4c49-992b-1a7a64df0807/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02e832c5-fda1-4c49-992b-1a7a64df0807/Untitled.png)

# 전처리 & 저장

---

- QGIS를 통해 500m 격자로 나눠 구역별 ID 부여 → 257개의 ID 생성
- 적절한 K개 선정 및 k-평균 군집화 진행

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2171b215-51b0-45b0-9c27-fd11e59b47a2/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2171b215-51b0-45b0-9c27-fd11e59b47a2/Untitled.png)

- 변수를 합친 데이터에 군집 Label을 부여함

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/117e1c33-d477-4211-b936-3fa161f49ced/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/117e1c33-d477-4211-b936-3fa161f49ced/Untitled.png)

- T-test 진행

# 분석

---

- 1번 군집과 6번 군집의 경우 타 군집에 비해 CCTV 설치수가 적은 것을 확인하였습니다.
1, 6번 군집을 비교분석한 결과는 아래와 같습니다.
- 1번 군집 : 단속건수 많고, 교통 단속 CCTV가 없는 구역
- 6번 군집 : 단속건수 적고, 교통 단속 CCTV가 없는 구역

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/38fb3848-d630-4b79-9ccb-0e6cc5ab7ea0/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/38fb3848-d630-4b79-9ccb-0e6cc5ab7ea0/Untitled.png)

# 결과

---

- 1번 군집의 단속건수 상위 10에 CCTV 추가 설치가 필요하다는 결과를 도출해냈습니다.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e2213ccd-a216-4250-b7a0-5377ff49439f/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e2213ccd-a216-4250-b7a0-5377ff49439f/Untitled.png)

# 실시간 단속 Navigator

---

- 실시간 단속 Navigator는 불편 신고 앱을 통한 신고 데이터를 통해
지도 시각화, 분석결과를 제공합니다.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f04034b6-213a-4e43-bffd-693be2eda902/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f04034b6-213a-4e43-bffd-693be2eda902/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b1486a1b-1464-4b2b-9eb3-f9506696424f/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b1486a1b-1464-4b2b-9eb3-f9506696424f/Untitled.png)

# Tools

---

분석 기간 : 2019년 10월 14일 ~ 2019년 11월 01일

# 주제 선정 이유

---

- 현재 서울시에서 불법주정차 감소 정책 (단속 기동반, CCTV, 생활불편 App 신고)을 시행하고 있지만 매년 증가
- 4년동안 전국적으로 불법주정차 연계형 사고 손실금액은 약 2,200억
- 서울 25개 구 중 불법 단속 건수, 서울 사업체, 종사자 수 1위인 강남구를 선정하여, 분석 진행함

# 분석 방향

---

- 공공데이터를 활용한 CCTV 취약 지역에 추가 배치 제안
- 실시간 불법 주정차 신고 데이터 분석 시스템을 통한
단속 지역 추천 대시보드 제공

# 분석 과정

---

- 교통 단속 CCTV 위치 추천, 실시간 단속 Navigator 분석 과정입니다.

    ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec682ea3-8c82-47f1-8e74-e997ca6f6077/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec682ea3-8c82-47f1-8e74-e997ca6f6077/Untitled.png)

# 데이터 수집

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

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02e832c5-fda1-4c49-992b-1a7a64df0807/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02e832c5-fda1-4c49-992b-1a7a64df0807/Untitled.png)

# 전처리 & 저장

---

- QGIS를 통해 500m 격자로 나눠 구역별 ID 부여 → 257개의 ID 생성
- 적절한 K개 선정 및 k-평균 군집화 진행

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2171b215-51b0-45b0-9c27-fd11e59b47a2/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2171b215-51b0-45b0-9c27-fd11e59b47a2/Untitled.png)

- 변수를 합친 데이터에 군집 Label을 부여함

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/117e1c33-d477-4211-b936-3fa161f49ced/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/117e1c33-d477-4211-b936-3fa161f49ced/Untitled.png)

- T-test 진행

# 분석

---

- 1번 군집과 6번 군집의 경우 타 군집에 비해 CCTV 설치수가 적은 것을 확인하였습니다.
1, 6번 군집을 비교분석한 결과는 아래와 같습니다.
- 1번 군집 : 단속건수 많고, 교통 단속 CCTV가 없는 구역
- 6번 군집 : 단속건수 적고, 교통 단속 CCTV가 없는 구역

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/38fb3848-d630-4b79-9ccb-0e6cc5ab7ea0/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/38fb3848-d630-4b79-9ccb-0e6cc5ab7ea0/Untitled.png)

# 결과

---

- 1번 군집의 단속건수 상위 10에 CCTV 추가 설치가 필요하다는 결과를 도출해냈습니다.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e2213ccd-a216-4250-b7a0-5377ff49439f/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e2213ccd-a216-4250-b7a0-5377ff49439f/Untitled.png)

# 실시간 단속 Navigator

---

- 실시간 단속 Navigator는 불편 신고 앱을 통한 신고 데이터를 통해
지도 시각화, 분석결과를 제공합니다.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f04034b6-213a-4e43-bffd-693be2eda902/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f04034b6-213a-4e43-bffd-693be2eda902/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b1486a1b-1464-4b2b-9eb3-f9506696424f/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b1486a1b-1464-4b2b-9eb3-f9506696424f/Untitled.png)

# Tools

---

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d591680e-4804-442e-9ed4-a222c0648bd7/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d591680e-4804-442e-9ed4-a222c0648bd7/Untitled.png)

