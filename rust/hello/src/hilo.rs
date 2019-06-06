use std::io;

fn main() {
    let upper: i32 = get_int();
    println!("{}", upper);
}

fn get_int() -> i32 {
    let mut n = String::new();
    io::stdin()
        .read_line(&mut n)
        .expect("failed to read input");

    let n: i32 = n.trim().parse().unwrap();
    return n;
}
