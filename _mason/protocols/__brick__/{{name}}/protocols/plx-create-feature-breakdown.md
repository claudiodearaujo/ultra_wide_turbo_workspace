---
document_type: protocol
goal: create structured and engaging feature breakdowns following our standard format
gpt_action: follow these steps when user wants to create a new feature breakdown
---

CONTEXT: The [[User]] wants to create a new feature breakdown and needs you to handle the creation process following our standard format and structure.

1. GIVEN [[User]] RUNS plx-create-feature-breakdown command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] CHECK feature type
         ```markdown
         # Feature Types
         - ui          : User interface components
         - api         : API implementations
         - integration : Third-party integrations
         - core        : Core functionality
         ```
      2. AND [[You]] CHECK required parameters
         ```markdown
         # Required Parameters
         - title        : Name in Pascal Case With Spaces
         - type         : One of the feature types above
         - difficulty   : 🟢 Easy | 🟡 Medium | 🔴 Hard
         - readingTime  : Duration (e.g., "15 minutes")
         ```
   2. IF [[input]] IS empty
      1. THEN [[You]] ASK [[User]] for feature type
      2. AND [[You]] ASK for required parameters

2. WHEN [[You]] CREATES breakdown
   1. THEN [[You]] CREATE file in features directory
      ```markdown
      # File Location
      feature-breakdowns/title-in-lowercase-with-dashes.md
      ```
   2. THEN [[You]] ADD frontmatter
      ```markdown
      # Frontmatter Format
      ---
      document_type: feature-breakdown
      title: Title In Pascal Case
      difficulty: 🟢 | 🟡 | 🔴
      reading_time: "15 minutes"
      feature_type: ui | api | integration | core
      gpt_action: follow these steps to understand [title]
      ---
      ```
   3. THEN [[You]] CREATE sections
      1. AND [[You]] ADD "📝 Table of Contents"
      2. AND [[You]] ADD "📝 Introduction"
      3. AND [[You]] ADD "🎯 The Plan"
      4. AND [[You]] ADD "💻 Implementation"
      5. AND [[You]] ADD "🧪 Testing"
      6. AND [[You]] ADD "🤔 Reflection"

3. WHEN [[You]] FILLS sections
   1. THEN [[You]] WRITE Table of Contents
      1. AND [[You]] LIST all sections
      2. AND [[You]] ADD reading time estimates
      3. AND [[You]] ADD difficulty indicators
   2. THEN [[You]] WRITE Introduction
      1. AND [[You]] EXPLAIN what and why
      2. AND [[You]] ADD feature overview screenshot
      3. AND [[You]] ADD "Prerequisites"
      4. AND [[You]] ADD "What You'll Learn"
      5. AND [[You]] ADD real-world use cases
   3. THEN [[You]] WRITE The Plan
      1. AND [[You]] CREATE numbered steps
      2. AND [[You]] ADD concept visualizations
      3. AND [[You]] ADD "Think About It" questions
      4. AND [[You]] ADD alternative approaches
   4. THEN [[You]] WRITE Implementation
      1. AND [[You]] ADD code snippets with comments
      2. AND [[You]] ADD implementation screenshots
      3. AND [[You]] ADD interaction GIFs
      4. AND [[You]] ADD "Code Breakdown" boxes
      5. AND [[You]] ADD "Common Errors"
   5. THEN [[You]] WRITE Testing
      1. AND [[You]] CREATE test scenarios
      2. AND [[You]] ADD test results screenshots
      3. AND [[You]] ADD "Test Writing Tips"
      4. AND [[You]] ADD debugging strategies
   6. THEN [[You]] WRITE Reflection
      1. AND [[You]] DISCUSS pros and cons
      2. AND [[You]] ADD performance notes
      3. AND [[You]] ADD security considerations
      4. AND [[You]] ADD future improvements

4. GIVEN [[breakdown]] IS ready
   1. THEN [[You]] ADD image placeholders
      1. AND [[You]] USE format
         ```markdown
         [SCREENSHOT: Feature overview showing final result]
         [GIF: Key user interactions with the feature]
         [STOCK: Concept visualization for complex parts]
         ```
   2. THEN [[You]] VERIFY style guidelines
      1. AND [[You]] CHECK emoticons
      2. AND [[You]] CHECK formatting
      3. AND [[You]] CHECK line breaks
   3. THEN [[You]] VERIFY content
      1. AND [[You]] CHECK all sections present
      2. AND [[You]] CHECK code examples
      3. AND [[You]] CHECK links
      4. AND [[You]] CHECK flowcharts

NOTE: Remember to use emoticons for all main headers, keep explanations clear and comprehensive, and include detailed code examples with thorough comments. Each section should follow the exact structure from [[how-we-create-feature-breakdowns]]. 
