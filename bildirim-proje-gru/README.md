
# React SPA - Geri Bildirim Paneli (Frontend)

Bu proje, kullanıcıların QR kod ile ulaşabilecekleri geri bildirim formunu doldurabileceği, firma sahiplerinin de bu bildirimleri analiz edebileceği bir web uygulamasının ön yüzüdür.

## 🚀 Teknolojiler

- ReactJS
- Vite
- Chakra UI
- Formik
- Framer Motion
## 📦 Kurulum

```bash
cd client
npm install
npm run dev 

.VITE.ENV Değiştirmeyi unutmayın
VITE_API_BASE_URL=http://localhost:5000/api




---



# 🛠️ FastAPI - Geri Bildirim Sistemi Backend

Bu proje, kullanıcıların QR kod veya bağlantı yoluyla ulaşıp geri bildirim verebildiği, işletme sahiplerinin de bu verileri analiz edebildiği bir **geri bildirim yönetim sisteminin RESTful API** servisidir.

---

## 🚀 Kullanılan Teknolojiler

- **FastAPI**: Modern, hızlı (ASGI tabanlı) ve otomatik dökümantasyon sağlayan Python web çatısı.
- **PostgreSQL**: Güçlü ilişkisel veritabanı.
- **SQLAlchemy**: ORM (Object Relational Mapper) ile veritabanı işlemleri.
- **JWT (JSON Web Token)**: Token tabanlı kimlik doğrulama.
- **Docker Compose**: Veritabanı konteyneri yönetimi.
- **Pydantic**: Veri doğrulama ve otomatik şema üretimi.

---
## ⚙️ Kurulum

```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/feedback_db
JWT_SECRET_KEY=supersecretkey
ACCESS_TOKEN_EXPIRE_MINUTES=60

### Docker Compose Yml


version: '3.8'

services:
  postgres:
    image: postgres:14
    container_name: feedback_postgres
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: feedback_db
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: unless-stopped

volumes:
  postgres_data:



