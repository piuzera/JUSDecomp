#!/usr/bin/env python3
"""gen_aliases.py — seed data/koma_aliases.json from popular character names."""
from __future__ import annotations

import json
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8")

db = json.load(open("data/koma_db.json", encoding="utf-8"))

# alias -> list of JP display names whose komas get the alias
WANTED = {
    # One Piece
    "luffy": ["ルフィ"], "zoro": ["ゾロ"], "nami": ["ナミ"],
    "sanji": ["サンジ"], "chopper": ["チョッパー"], "usopp": ["ウソップ"],
    "ace": ["エース"], "shanks": ["シャンクス"], "robin": ["ロビン"],
    # Naruto
    "naruto": ["ナルト"], "sasuke": ["サスケ"], "sakura": ["サクラ"],
    "kakashi": ["カカシ"], "gaara": ["我愛羅"], "rocklee": ["ロック・リー"],
    # Dragon Ball
    "goku": ["悟空"], "vegeta": ["ベジータ"], "gohan": ["孫悟飯"],
    "piccolo": ["ピッコロ"], "krillin": ["クリリン"], "trunks": ["トランクス"],
    # Bleach
    "ichigo": ["一護"], "rukia": ["ルキア"], "renji": ["恋次"],
    "byakuya": ["白哉"], "hitsugaya": ["日番谷"], "aizen": ["藍染"],
    # Eyeshield 21
    "sena": ["セナ"], "hiruma": ["ヒル魔"], "monta": ["モン太"],
    # Hunter x Hunter
    "gon": ["ゴン"], "killua": ["キルア"], "kurapika": ["クラピカ"],
    "hisoka": ["ヒソカ"],
    # Yu Yu Hakusho
    "yusuke": ["幽助"], "hiei": ["飛影"], "kurama": ["蔵馬"],
    "kuwabara": ["桑原"],
    # Rurouni Kenshin
    "kenshin": ["剣心"], "saito": ["斎藤"], "shishio": ["志々雄"],
    # Saint Seiya
    "seiya": ["星矢"], "ikki": ["一輝"], "shiryu": ["紫龍"],
    # JoJo
    "jotaro": ["承太郎"], "dio": ["DIO", "ディオ"], "joseph": ["ジョセフ"],
    # Slam Dunk
    "sakuragi": ["桜木花道"], "rukawa": ["流川楓"],
    # Gintama
    "gintoki": ["銀さん"],
    # Reborn
    "tsuna": ["ツナ／リボーン"], "hibari": ["雲雀"], "reborn": ["リボーン"],
    # Death Note
    "light": ["ライト／リューク", "ライト"], "L": ["エル"],
    "misa": ["弥海砂"], "ryuk": ["リューク"],
    # Yu-Gi-Oh
    "yugi": ["遊戯"], "kaiba": ["海馬"], "joey": ["城之内"],
    # Hokuto no Ken
    "kenshiro": ["ケンシロウ"], "raoh": ["ラオウ"], "toki": ["トキ"],
    # D.Gray-man
    "allen": ["アレン"], "kanda": ["神田"],
    # Shaman King
    "yoh": ["葉"], "ren": ["蓮"], "anna": ["恐山アンナ", "アンナ"],
    # Prince of Tennis
    "ryoma": ["リョーマ"], "tezuka": ["手塚"], "fuji": ["不二"],
    # Bobobo
    "bobobo": ["ボーボボ"], "donpatchi": ["首領パッチ"],
    # Neuro
    "neuro": ["ネウロ／弥子"], "yako": ["ネウロ／弥子"],
    # Muhyo
    "muhyo": ["ムヒョ"], "roji": ["ロージ"],
    # Kinnikuman
    "kinnikuman": ["キン肉マン"], "terryman": ["テリーマン"],
    "robinmask": ["ロビンマスク"],
    # Kochikame
    "ryotsu": ["両さん"], "rj": ["両さん"],
    # Captain Tsubasa
    "tsubasa": ["大空翼"], "misaki": ["岬"], "wakabayashi": ["若林"],
    # I''s
    "iori": ["伊織"], "izumi": ["磯崎泉"],
    # Ichigo 100%
    "manaka": ["真中"], "toujou": ["東城"], "satsuki": ["西野"],
    # Dr. Slump
    "arale": ["アラレ"], "senbei": ["千兵衛"],
    # J Galaxy tutorial komas
    "komared": ["コマレッド"], "komagreen": ["コマグリーン"],
    "komayellow": ["コマイエロー"],
    # Specials
    "frieza": ["フリーザ"], "buu": ["魔人ブウ"],
}

aliases: dict[str, list[int]] = {}
report = []
for alias, jp_names in WANTED.items():
    ids = []
    for k in db["komas"]:
        if k["name_jp"] in jp_names:
            ids.append(k["id"])
    if ids:
        aliases[alias] = ids
        report.append(f"{alias}: {len(ids)} komas {ids}")
    else:
        report.append(f"{alias}: NO MATCH")

# anchors (redundant safety, ids already covered by names above)
for alias, kid in (("sena1", 0), ("luffy4", 823), ("luffy5", 824),
                   ("zoro2", 830)):
    aliases.setdefault(alias, [kid])

out = Path("data/koma_aliases.json")
out.write_text(json.dumps(aliases, ensure_ascii=False, indent=1),
               encoding="utf-8")
print("\n".join(report))
print(f"wrote {out} ({len(aliases)} aliases)")
