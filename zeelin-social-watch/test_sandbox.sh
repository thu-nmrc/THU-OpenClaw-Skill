#!/usr/bin/env bash
# gsdata-skill Sandbox Test Script

set -e

echo "======================"
echo "[TEST 1] List tools"
echo "======================"
python3 ./gsdata_adapter.py list-tools
echo -e "\n\n"

echo "======================"
echo "[TEST 2] Keyword search (size=2)"
echo "======================"
python3 ./gsdata_adapter.py invoke \
  --tool gsdata_pubsent_search \
  --action search \
  --param keywords_include=人工智能 \
  --param size=2
echo -e "\n\n"

echo "======================"
echo "[TEST 3] Hot events"
echo "======================"
python3 ./gsdata_adapter.py invoke \
  --tool gsdata_pubsent_hot \
  --action event_list \
  --param type=1
echo -e "\n\n"

echo "======================"
echo "[TEST 4] Xiaohongshu account search"
echo "======================"
python3 ./gsdata_adapter.py invoke \
  --tool gsdata_account \
  --action search \
  --platform xiaohongshu \
  --param xiaohongshu_name=AI \
  --param size=2
echo -e "\n\n"

echo "======================"
echo "[TEST 5] Public rank query (Day, XHS)"
echo "======================"
python3 ./gsdata_adapter.py invoke \
  --tool gsdata_rank_public \
  --action day \
  --platform xiaohongshu \
  --param date=2026-02-23
echo -e "\n\n"

echo "======================"
echo "[TEST 6] DRY RUN Write action (Warning Rule)"
echo "======================"
python3 ./gsdata_adapter.py invoke \
  --tool gsdata_pubsent_warning \
  --action create_rule \
  --params '{"name":"demo"}' \
  --dry-run 
echo -e "\n"

echo "ALL TESTS FINISHED"
