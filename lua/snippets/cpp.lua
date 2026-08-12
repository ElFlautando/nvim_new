return {
  s("include_print", t("#include<print>")),
  s("main", fmt([[
    auto main() -> int{{

      return 0;
    }}

    ]]
  , {})),
  s("print",
    fmt(
      [[ std::print( "{{}}", {} );]], { i(1, "x") }
    )
  ),
}
