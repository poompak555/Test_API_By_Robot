# Test_API_Robot
Example of creating body and testing an API with Robot Framework.

```json
Header = {
            'Content-Type': 'application/x-www-form-urlencoded'
         }
```

```json


Body = {
            'name-en': String
            'name-th': String
            'food_calories': String
            'image_url': String
        }
        
        
```
```json


Respons = {
            "data": [
                       {
                         "id": 1,
                         "name_en": "Fish maw soup",
                         "name_th": "กระเพาะปลา",
                         "calories": 319,
                         "image_url": "https://www.bloggang.com/data/j/jazzy-bong/picture/1603701135.jpg"
                       }
                    ]
           }

```
