#!/bin/bash
cd "$(dirname "$0")"
export DATABASE_URL='mysql://root:051212.zjH@127.0.0.1:3306/goodjob_crm'
export JWT_SECRET='goodjob_crm_jwt_secret_2024_32chars_long!'
export PROVIDER_CREDENTIAL_KEY='goodjob_crm_provider_credential_key_32char'
export AGENT_JOB_ENCRYPTION_KEY='goodjob_crm_agent_job_encryption_key_32'
export MARKET_OPPORTUNITY_CURSOR_SECRET='goodjob_crm_market_opp_cursor_32chr!'
export TRADE_OBSERVATION_CURSOR_SECRET='goodjob_crm_trade_obs_cursor_32char!'
export PROSPECT_RUN_IDEMPOTENCY_SECRET='goodjob_crm_prospect_idempotency_32ch'
export PROSPECT_RUN_CURSOR_SECRET='goodjob_crm_prospect_run_cursor_32char'
export CORS_ORIGINS='http://127.0.0.1:5188,http://localhost:5188,http://192.168.1.6:5188,http://192.168.1.6:3000,http://www.zsfer.cn:5188'
export SESSION_COOKIE_SECURE='false'
export PORT='4188'
export NODE_ENV='production'
exec node dist/server.js
