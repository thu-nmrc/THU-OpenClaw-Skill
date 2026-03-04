# gsdata-skill

A Clawhub-compatible skill for accessing the GSData (清博智能) Open Platform. 

This skill allows AI agents operating via OpenClaw to perform account, content, rank, public sentiment (舆情), and NLP queries using GSData's API.

## Installation

This skill is designed to be installed by agents via OpenClaw. 

You can point your agent to this GitHub repository directly:

```bash
clawhub install github:yangyuwen-bri/gsdata-skill
```

## Configuration

This skill requires a GSData (清博智能) App Key and App Secret. 

**To get an API Key:**
1. Register as a user on the [GSData Open Platform](http://openapi.gsdata.cn/).
2. Create an Application in the user center.
3. Obtain your `app_key` and `app_secret`.

You must provide these as environment variables to your OpenClaw runtime:

```bash
export GSDATA_APP_KEY="your_gsdata_app_key"
export GSDATA_APP_SECRET="your_gsdata_app_secret"
```

## Features for Agents

The included `SKILL.md` contains strict guidelines to ensure the agent uses the API responsibly:
- **Chat Context Protection:** Enforces a `--param size=5` limit to prevent huge JSON dumps in Telegram/chat scenarios.
- **Write Protections:** Read-only by default. Creating or modifying rules requires explicit user confirmation and the `--allow-write` flag.
- **Dry-run Validations:** Recommends running `--dry-run` to ensure endpoint mappings are correct before sending a live network request.

## Real-World Examples

Here are some examples of the real data your Agent can access when this skill is installed.

### Scenario 1: Market Intelligence (舆情分析)
**Goal**: Find recent sentiment and news about "人工智能" (Artificial Intelligence).

**Command Executed by Agent:**
```bash
python3 ./gsdata_adapter.py invoke \
  --tool gsdata_pubsent_search \
  --action search \
  --param keywords_include=人工智能 \
  --param size=1
```

**Raw JSON Response (Truncated):**
```json
{
  "ok": true,
  "statusCode": 200,
  "tool": "gsdata_pubsent_search",
  "action": "search",
  "response": {
    "success": true,
    "data": {
      "newsList": [
        {
          "news_title": "一场关于生命、疾病与治愈的深度对话。AI时代，医生何为？...",
          "news_emotion": "中性",
          "media_type": "weibo",
          "media_name": "markmz峥嵘岁月",
          "news_posttime": "2026-03-03 19:14:46",
          "news_keywords": ["医学", "系统", "时代", "人文", "AI", "疾病"]
        }
      ],
      "numFound": 5024397
    }
  }
}
```

### Scenario 2: Hot Event Tracking (热点追踪)
**Goal**: Get the current top trending events across the internet.

**Command Executed by Agent:**
```bash
python3 ./gsdata_adapter.py invoke \
  --tool gsdata_pubsent_hot \
  --action event_list \
  --param type=1
```

**Raw JSON Response (Truncated):**
```json
{
  "ok": true,
  "statusCode": 200,
  "tool": "gsdata_pubsent_hot",
  "action": "event_list",
  "response": {
    "success": true,
    "data": {
      "newsList": [
        {
          "news_title": "全国政协十四届四次会议会期、议程，来了",
          "news_emotion": "中性",
          "news_tags": "时政",
          "publish_time": "2026-03-03 16:25",
          "sim_count": "749"
        },
        {
          "news_title": "比亚迪2月销售19万辆，稳居新能源销冠",
          "news_emotion": "中性",
          "news_tags": "财经",
          "publish_time": "2026-03-03 16:25",
          "sim_count": "571"
        },
        {
          "news_title": "中国经济顶压前行 展现强大韧性和活力",
          "news_emotion": "中性",
          "news_tags": "财经",
          "publish_time": "2026-03-03 15:32",
          "sim_count": "542"
        }
      ]
    }
  }
}
```

## Files
- `SKILL.md`: The primary instructions for the Agent with OpenClaw metadata.
- `gsdata_adapter.py`: The local python adapter that handles API routing and authentication.
- `gsdata_tool_mapping_v1.json`: The endpoint mapping definitions.
- `example_api_responses.log`: Full, uncut raw JSON responses from our sandbox testing, serving as a data reference.
- `test_sandbox.sh`: Script for local verification of credentials and API endpoints.
- `LICENSE`: The open source MIT License for this project.
