function claude-lmstudio --description "Claude Code against a local model served by LM Studio"
    if test (count $argv) -eq 0
        echo "usage: claude-lmstudio <model-id> [claude args...]" >&2
        return 1
    end

    set -l model $argv[1]
    set -e argv[1]

    if not curl -sf -m 2 -o /dev/null http://localhost:1234/v1/models
        echo "Starting LM Studio server..."
        lms server start --port 1234; or return 1
    end

    if not curl -sf -m 10 http://localhost:1234/v1/models | string match -q "*\"$model\"*"
        echo "Model '$model' is not available in LM Studio. Downloaded models:" >&2
        lms ls >&2
        return 1
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
