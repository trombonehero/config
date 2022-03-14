.tests
| sort_by(.number)[]
| "📝 \(.number) \(.name)\n"
  + "💯 Score: \(.score)/\(.max_score)\n️"
  + "🖨️Output:\n\(.output)"
