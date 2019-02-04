```bash
curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{"queryResult": {"parameters": {"id": "4"},"action": "remove"}}'
{"payload":{"telegram":{"text":"Deletado com sucesso","parse_mode":"Markdown"}}}⏎

curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{"queryResult": {"contexts": [{"parameters": {"question": "ques", "answer": "answ1", "hashtags": "php, js"}}],"action": "create"}}'
{"payload":{"telegram":{"text":"Criado com sucesso","parse_mode":"Markdown"}}}

curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{"queryResult": {"contexts": [{"parameters": {"query": "a"}}],"action": "list"}}'

curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{"queryResult": {"parameters": {"query": "inter resposta"},"action": "search"}}'

curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{"queryResult": {"parameters": {},"action": "help"}}'

```
