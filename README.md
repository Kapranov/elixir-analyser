# ElixirAnalyser

**TODO: Add description**

`ElixirAnalyzer` at this point will run static analysis. The result json
file is output to the destination folder.

`ElixirAnalyzer.Exercise` is able to generate static analysis tests and
the analyze function loads the features to be tested.


### How to run the prototype

`iex -S mix`, then calling `ElixirAnalyzer.analyze_exercise("slug-name",
"/path/to/solution/", "/path/to/output/")`. This assumes the solution
has the file of the proper name and also a test unit by the proper name.
At this time "two-fer" is the only solution implemented at a most basic
level. All that gets validated is if it passes the test unit completely.
Goal will be to able to recognize the optimal solution through ast
search for specific patterns. As a demonstration, once iex loads with
`iex -S mix` you can type `ElixirAnalyzer.analyze("two-fer",
"./test_data/two_fer/passing_solution/", "./test_data/results/")`.

### `ElixirAnalyzer`

- The is the main application module. A function call to
  `start_analyze/3` begins the analysis (either through IEX [if generated]).
- A json configuation `config/exercise_data.json` holds data for each
  exercise supported

```
{
  "two-fer": {
    "code_file": "two_fer.ex",
    "analyzer_module": "ElixirAnalyzer.Exercise.TwoFer"
  }
}
```

- `analyze` then loads the appropriate files from the exercise solution
- `analyze` then calls the `analyze/x` function from the
  `analyzer_module`.


### `ElixirAnalyzer.Submission`

This is a module that contains a struct of the same name with operations
to manipulate itself. Contains the exercise information, list of all the
comments to be returned to the student, the solution status.

This struct is passed along throughout the analysis of the solution

### `ElixirAnalyzer.ExerciseTest`

This module contains macros for a DSL to be able to compare ideal
solution features to the exercise solution attempt.

```
use ElixirAnalyzer.Exercise

feature "has spec" do
  status   :test
  find     :all
  on_fail  :info
  comment  Constants.two_fer_no_specification

  form do
    @spec two_fer(String.t()) :: String.t()
  end
end
```

### `ElixirAnalyzer.Constants`

Contains macro to generate a function returning the comment path on the
`exercism/website-copy` repository. The current plan is to centralize
these so that they can be easily tested and changed

### `ElixirAnalyzer.ExerciseTest.________`

These modules are for describing the tests for which the analyzer is
able to determine the state of the solution based on style, syntax.
They use `ElixirAnalyzer.Exercise` for macro generation of code.

### Other Plans

1. Develop the environment for execution (done)
2. Finish the escript to be able to call the program from the command
   line with command line arguments (done)
3. Create the bash script to call the application with the parameters
   needed (done)
4. Create the Dockerfile in order to create the environment for the
   application to be run. (done)

## Installation

```
bash> mkdir elixir-analyser
bash> mix new --app "elixir_analyser" ./
```

### Oct 2020 by Oleg G.Kapranov

[1]: https://dev.to/neenjaw/writing-an-elixir-code-analyzer-with-metaprogramming-magic-fl4
[2]: https://github.com/exercism/elixir-analyzer
