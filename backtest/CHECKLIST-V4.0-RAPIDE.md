# ✅ CHECKLIST V4.0 — Aide-mémoire session (à imprimer ou afficher à côté de TradingView)

## 🕐 Avant la session (5 min)

- [ ] Heure CET vérifiée → **on ne trade QUE 14h30-18h (NYAM)**
- [ ] Calendrier éco checké (pas de news rouge dans les 30 min)
- [ ] Biais D1 défini (bullish / bearish / neutre) sur **BTC + asset**
- [ ] Biais H4 aligné avec D1 (sinon = pas de trade)
- [ ] Niveaux clés marqués : **Asia Low / Asia High / PDH / PDL**
- [ ] État mental : dormi 7h+ · pas en tilt · pas de tunnel post-perte

## 🎯 Pendant la détection setup (M15)

**5 conditions STRICTES (toutes obligatoires — sinon skip)**

| # | Condition | Check |
|---|-----------|-------|
| 1 | **Biais HTF bullish** (D1+H4 haussiers) | ⬜ |
| 2 | **Sweep de liquidité** (mèche sous Asia Low ou niveau clé) | ⬜ |
| 3 | **Displacement** (3+ bougies M15 haussières + gros corps) | ⬜ |
| 4 | **FVG bullish créée** dans le displacement | ⬜ |
| 5 | **Bougie 2** à la mitigation (2e bougie casse high de la 1ère) | ⬜ |

**Bonus (+2 au score) :**
- [ ] OB bullish visible dans la FVG
- [ ] SMT divergence avec BTC (asset fait higher low, BTC lower low)
- [ ] Silver Bullet Window (15h30-16h CET) = heure magique

## 📊 Paramétrage du trade

| Élément | Règle |
|---------|-------|
| **Entry** | Close de la bougie 2 (confirmation) |
| **SL** | Sous la mèche du sweep (= low de la zone) + buffer 0,1% |
| **TP1** | RR 1:1 → sortir 50% + passer SL à BE |
| **TP2** | RR 2:1 minimum (3:1 si setup 9-10/10) |
| **Risk** | 1% standard · 1,5% si setup A+ 10/10 · **jamais >1,5%** |
| **Taille** | `(Capital × Risk %) / (Entry - SL) × Entry` |

## 🚫 Interdits absolus

- ❌ Trader hors session NYAM (14h30-18h CET)
- ❌ Trader si biais HTF neutre/bearish
- ❌ Entry sans bougie 2 (= pari, pas setup)
- ❌ Bouger le SL contre soi
- ❌ Plus de 3 trades / jour (qualité > quantité)
- ❌ Reprendre un trade après 2 SL consécutifs (= fin de session)
- ❌ Retirer le SL à BE avant que TP1 soit touché

## 📝 Après chaque trade (journal)

Remplir immédiatement dans `journal-trades-v4.0.csv` :
- Les 5 conditions (OK/KO pour chacune)
- Score setup /10 (auto-évaluation honnête)
- Émotion pendant le trade (1-5)
- **Leçon** — 1 phrase : qu'est-ce qui a marché/pas marché ?

## 🎓 Débrief tous les 10 trades

→ Me ping avec le CSV rempli, je fais l'analyse :
- WR par condition (quelle condition échoue le plus ?)
- PF par asset (TAO vs ARB vs SUI vs FET — lequel est le plus rentable ?)
- Heures gagnantes (début NYAM vs Silver Bullet vs fin de session)
- Ajustements V4.1 si patterns clairs

## 🎯 Objectif 50 trades

- **WR cible** : ≥ 55% (avec RR 2:1 ça donne PF ≥ 2.2)
- **DD max** : ≤ 15% du capital
- **% P&L cumulé** : ≥ +40% sur 50 trades (≈ 1 mois)
- **Go Live** si tous les seuils OK à la fin

---

🎬 **Regarde la vidéo `nodex-v4.0-formation.mp4` si tu as un doute sur le setup.**
📊 **Utilise `formation-v4.0.html` pour revoir les étapes en interactif.**
