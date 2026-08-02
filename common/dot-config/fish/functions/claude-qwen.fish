function claude-qwen --description "Claude Code against local Qwen via LM Studio"
    set -l model qwen/qwen3.6-35b-a3b

    if not curl -sf -m 2 -o /dev/null http://localhost:1234/v1/models
        echo "Starting LM Studio server..."
        lms server start --port 1234; or return 1
    end

    set -lx CLAUDE_CONFIG_DIR $HOME/.claude-lmstudio

    set -lx ANTHROPIC_BASE_URL http://localhost:1234
    set -lx ANTHROPIC_AUTH_TOKEN lmstudio

    set -lx ANTHROPIC_MODEL $model
    set -lx ANTHROPIC_DEFAULT_OPUS_MODEL $model
    set -lx ANTHROPIC_DEFAULT_SONNET_MODEL $model
    set -lx ANTHROPIC_DEFAULT_HAIKU_MODEL $model
    set -lx ANTHROPIC_SMALL_FAST_MODEL $model
    set -lx CLAUDE_CODE_SUBAGENT_MODEL $model

    set -lx CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC 1

    command claude --model $model $argv
end
