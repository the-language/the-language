use the_lang::*;

#[test]
fn it_works() {
    let l = Lang::new();
    assert_eq!(l.complex_print(&l.complex_parse(&String::from("()"))), String::from("()"));
    assert_eq!(l.machinetext_parse(&String::from("_")), l.complex_parse(&String::from("()")));
}
