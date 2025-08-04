# Reflection: Real-World Database Applications

## 1. E-commerce Platform (e.g., Amazon)
- **Database Needs:** Orders, payments, inventory, user data.
- **Type Used:** RDBMS for transactions/integrity; NoSQL for product catalog/search speeds.

## 2. Ride-Sharing Service (e.g., Uber)
- **Database Needs:** Real-time driver locations, trip data, payments, maps.
- **Type Used:** RDBMS with PostGIS for spatial/trip data; NoSQL (Redis, MongoDB) for real-time/quick reads.

## 3. Social Networking Site (e.g., Twitter)
- **Database Needs:** User profiles, relationships, message feed, analytics.
- **Type Used:** RDBMS for user relationships/data; NoSQL for feeds and analytics (high write/read loads).
