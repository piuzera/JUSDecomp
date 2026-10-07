use ds_rom::compress::lz77::Lz77;
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let input = std::fs::read(&args[1]).unwrap();
    let start = args[3].parse::<usize>().unwrap();
    assert!(!std::path::Path::new(&args[2]).exists(), "fresh codec output required");
    let output = Lz77 {}.compress(&input, start).unwrap();
    assert_eq!(&*Lz77 {}.decompress(&output).unwrap(), &input);
    std::fs::write(&args[2], output).unwrap();
}
#[cfg(test)] mod tests {
    use super::*;
    #[test] fn invented_repeat_roundtrip_and_encoding() {
        let input = vec![b'A'; 256];
        let encoded = Lz77 {}.compress(&input, 0).unwrap();
        assert!(encoded.len() < input.len());
        assert_eq!(&*Lz77 {}.decompress(&encoded).unwrap(), &input);
    }
}
