# 🎯 NODEX V4.0 — STRATÉGIE HYBRIDE CONSOLIDÉE

> **Date création** : 2026-04-23
> **Status** : méthode officielle pour backtest manuel 30-50 trades
> **Base** : CLT (Crypto Le Trône) + filtres Hugo FX + bonus SMC/ICT
> **Objectif 1er mois** : 30-50 trades loggés pour vraie validation

---

## 📌 ADN DE LA STRATÉGIE (en 3 lignes)

1. **TIMING** — On trade UNIQUEMENT pendant la session NYAM (14h30-18h Paris)
2. **CONTEXTE** — HTF bullish obligatoire (Daily + H4 au-dessus EMA 50)
3. **PATTERN** — Liquidity Sweep → Displacement → FVG → Bougie 2 confirmante → Entry

---

## 🧩 D'OÙ VIENNENT LES RÈGLES ?

| Source | Ce qu'on prend | Pourquoi |
|---|---|---|
| **🇺🇸 CLT** | Sessions NYAM, Liquidity Sweep, News filter, Risk dégressif | Méthode validée (1 pote rentable), crypto-native |
| **🇬🇧 Hugo FX** | Règle Bougie 2, Filtre HTF bullish, MMM framework | Filtre qualité qui évite les faux signaux |
| **🧭 SMC/ICT** | Silver Bullet (15-16h Paris), PO3, SMT bonus | Bonus quand CLT donne pas assez de setups |

---

## 🚫 CE QU'ON JETTE

- ❌ **Kill Zone London** (trop de bruit sur crypto alts)
- ❌ **Elliott Wave** (trop complexe, à garder pour plus tard)
- ❌ **FVG Touch mitigation** (faible, on garde que Wick/Close)
- ❌ **Setups contre-tendance HTF** (jamais, peu importe l'excellence du setup M15)
- ❌ **Short** (spot long only - non négociable)

---

## ⏰ 1. LA ROUTINE QUOTIDIENNE

### 🌅 Avant 14h00 Paris (10 min)
- [ ] **Ouvrir TradingView** M15
- [ ] **Choisir l'actif** (priorité bullish HTF) : TAO, ETH, BTC, SOL
- [ ] **Check calendrier économique** : pas de news majeure (CPI/FOMC/NFP) dans les 4h ? Sinon → skip jour
- [ ] **Marquer 6 niveaux sur le chart** :
  - PDH (Previous Daily High)
  - PDL (Previous Daily Low)
  - Asia High (plus haut entre 01h-06h Paris)
  - Asia Low (plus bas entre 01h-06h Paris)
  - London High (plus haut entre 09h-12h Paris)
  - London Low (plus bas entre 09h-12h Paris)

### 🔔 14h30-18h Paris — NYAM Active (30 min focus)

**Règle des 10 premières minutes** : **NE PAS rentrer entre 14h30 et 14h45** (Judas swing / manipulation classique).

**À partir de 14h45** : chercher le pattern :

```
┌─────────────────────────────────────────────────┐
│  LIQUIDITY SWEEP                                │
│  (Asia Low / London Low / PDL cassé puis repris)│
│           ↓                                     │
│  DISPLACEMENT BULLISH                           │
│  (Bougie verte forte avec range > 1,5× ATR)     │
│           ↓                                     │
│  FVG CRÉÉE                                      │
│  (Gap entre 3 bougies pendant le displacement)  │
│           ↓                                     │
│  RETRACE DANS LA FVG                            │
│  (Wick ou Close dans la zone, PAS Touch)        │
│           ↓                                     │
│  BOUGIE 2 BULLISH                               │
│  (Ferme au-dessus du high de la bougie de mit.) │
│           ↓                                     │
│  ✅ ENTRY LONG                                  │
└─────────────────────────────────────────────────┘
```

---

## ✅ 2. LA CHECKLIST AVANT CHAQUE ENTRÉE

**9 points à cocher** avant d'appuyer sur "Buy". **5/9 minimum = B+** (entry autorisée).

### 🔴 OBLIGATOIRES (3 points, sinon SKIP)
- [ ] **#1** — HTF bullish ? (Daily **OU** H4 au-dessus EMA 50)
- [ ] **#2** — Session NYAM active ? (14h30-18h Paris)
- [ ] **#3** — Pas de news majeure dans 30 min ?

### 🟠 FORTEMENT RECOMMANDÉES (4 points)
- [ ] **#4** — Liquidity sweep récent ? (Asia L / London L / PDL pris dans les 20 dernières bougies)
- [ ] **#5** — Displacement bullish identifié ? (bougie verte puissante)
- [ ] **#6** — FVG visible créée par le displacement ?
- [ ] **#7** — Bougie 2 bullish confirmée ? (ferme au-dessus du high de la mit bar)

### 🟢 BONUS (2 points)
- [ ] **#8** — Entry dans zone OTE Fibo (0,5-0,85) ?
- [ ] **#9** — SMT divergence BTC favorable ?

### 📊 Classification
| Score | Niveau | Risk | RR cible |
|---|---|---|---|
| **8-9/9** | **A+** | 1,5% | 2-3 |
| **7/9** | **A** | 1,25% | 2 |
| **6/9** | **B+** | 1% | 2 |
| **5/9** | **B** | 0,5% | 2 |
| **<5** | **C** | SKIP | — |

---

## 💰 3. PLACEMENT DU TRADE

### Entry
- **Prix** : close de la bougie 2 confirmante
- Alternative : retest de la FVG dans les 3 prochaines bougies

### Stop Loss (SL)
- **Sous le low du sweep** (priorité) OU **sous le low de la FVG**
- **Distance minimum** : 0,4% sous entry (buffer anti-volatilité)
- **Jamais** moins de 0,3% (trop serré)

### Take Profit (TP)
- **TP1** : à RR 1:1 = Entry + (Entry - SL) → sortie 50% + SL à Break Even
- **TP2** : au **prochain point d'intérêt** non-pris :
  - PDH (prioritaire)
  - Asia High (si au-dessus entry)
  - London High (si au-dessus entry)
  - Extension Fibo 1,618
- **Minimum RR 1:2** sur TP2, sinon skip

### Position Size
```
Size = (Capital × Risk%) / (Entry - SL)
Max 25% du capital par position
```

**Exemple** : Capital 10 000 €, Entry 0,13, SL 0,127, Risk 1,25%
- Distance SL : 0,003
- Size = (10 000 × 0,0125) / 0,003 = **41 666 unités**
- Limite 25% : 10 000 × 0,25 / 0,13 = 19 230 unités
- **Qty finale** = min(41 666, 19 230) = **19 230 unités**

---

## 🎮 4. GESTION EN POSITION

### TP1 touché (RR 1:1)
- [ ] Sortir **50%** de la position
- [ ] **Déplacer SL à entry** (Break Even) → position "risk-free"

### Après TP1
- [ ] Laisser les **50% restants** courir vers TP2
- [ ] **Ne plus déplacer le SL** (pas de "trailing agressif")

### TP2 touché (RR 1:2)
- [ ] Sortir les 50% restants → trade clôturé gagnant

### SL touché
- [ ] Exit 100%
- [ ] **Pas de revenge trade** — respirer, analyser, continuer
- [ ] Si 2 pertes consec dans la journée → **stop session**

### Fin de NYAM (18h Paris) avec position ouverte
- [ ] **Fermer manuellement à 18h** (règle CLT stricte)
- [ ] Le marché peut bouger pendant la nuit, trop risqué

---

## 📝 5. LOG DANS NODEX JOURNAL

**14 champs obligatoires** pour chaque trade (même les skips si tu veux tracker) :

| # | Champ | Exemple |
|---|---|---|
| 1 | Date | 2026-04-23 |
| 2 | Heure entry Paris | 15:45 |
| 3 | Asset | TAO/USDT |
| 4 | **Score /9** | 7 |
| 5 | **Niveau** | A |
| 6 | Entry | 244,80 |
| 7 | SL | 242,30 |
| 8 | TP1 (RR 1:1) | 247,30 |
| 9 | TP2 (RR 1:2) | 249,80 |
| 10 | Risk % | 1,25% |
| 11 | **Setup type** | FVG+Sweep / OB+CHoCH / Unicorne |
| 12 | **Contexte HTF** | Daily bull / H4 bull / BTC bull |
| 13 | **Résultat** | W / L / BE / Partial |
| 14 | **% P&L** | +2,1% |

### Notes à ajouter OBLIGATOIREMENT
- **Strategy tag** : "V4.0-Hybride"
- **Ce qui m'a convaincu** de prendre ce trade
- **Leçon apprise** (même sur un gain)
- **État psychologique** (calme/stressé/pressé)

---

## 🚫 6. INTERDITS ABSOLUS

1. ❌ **Trader hors NYAM** (14h30-18h Paris) — max 3 exceptions/mois si setup A+ absolu
2. ❌ **Trader contre HTF** (Daily bearish + H4 bearish → jamais de long)
3. ❌ **Augmenter le risk après une perte** (revenge trading classique)
4. ❌ **Bouger le SL à la défaveur** (trailing downward = auto-sabotage)
5. ❌ **Averaging down** (ajouter à une position perdante)
6. ❌ **Trader sans la bougie 2** confirmante
7. ❌ **Trader 30 min avant/après CPI/FOMC/NFP**
8. ❌ **Shorts** (spot long only, non négociable)
9. ❌ **Plus de 3 trades/jour** (dépassement = fatigue décisionnelle)
10. ❌ **Logger plus tard** (le trade non logé immédiatement = perdu pour la stat)

---

## 🎯 7. OBJECTIFS 30 JOURS

| Métrique | Seuil minimum | Seuil confortable | Seuil excellent |
|---|---|---|---|
| **Trades cumulés** | 20 | 35 | 50+ |
| **Trades/jour moyen** | 0,7 | 1,2 | 2 |
| **WR global** | ≥ 45% | ≥ 55% | ≥ 65% |
| **Profit Factor** | ≥ 1,3 | ≥ 1,8 | ≥ 2,5 |
| **Max DD** | < 10% | < 7% | < 5% |
| **Pertes consec max** | ≤ 4 | ≤ 3 | ≤ 2 |
| **P&L mensuel** | > +2% | > +5% | > +10% |

---

## 🎯 8. CRITÈRES DE PROMOTION LIVE

Après 30 jours de backtest/paper trading V4.0 :

### ✅ Go live (10% capital)
- WR ≥ 50% + PF ≥ 1,5 sur 30+ trades
- Max DD < 8%
- Discipline respectée (aucun breach des interdits)

### 🟡 Extension paper (+30 jours)
- WR 45-50% ou PF 1,3-1,5
- Besoin de plus de sample pour valider

### 🔴 Retour planche
- WR < 45% ou PF < 1,3
- Probablement problème de discipline ou de contexte de marché
- Débrief avec Claude → identifier la faille

---

## 🎓 9. SETUPS PRIORITAIRES (par ordre)

### 🥇 Setup #1 — **CLT Liquidity Sweep + FVG Mitigation**
Le setup de base. **70% de tes trades** devraient être celui-là.
- Asia Low / London Low / PDL sweep
- Displacement bullish
- FVG créée + mitigée
- Bougie 2 confirme
- Entry

### 🥈 Setup #2 — **Hugo MMM Complet**
Plus rare mais **très puissant**. 15-20% de tes trades.
- SSL Daily/H4 pris
- MSS H1 ou M15
- FVG + retrace
- Bougie 2
- Entry (setup A+, risk 1,5%)

### 🥉 Setup #3 — **SMC Silver Bullet** (15-16h Paris)
Bonus quand les 2 premiers ne donnent rien. **10-15% de tes trades**.
- Créneau horaire NY 10-11h = Paris 15-16h
- Souvent le vrai move post-manipulation NYAM
- Entry sur premier pullback après le Silver Bullet move

---

## 🧠 10. MINDSET

### À répéter avant chaque session
1. "Je ne force pas les trades — j'attends le bon setup"
2. "Ma discipline fait mon edge, pas ma méthode"
3. "Une perte = une leçon, pas un drame"
4. "Je logge TOUT — même les skips"
5. "J'arrête à 2 pertes consec — je reviendrai demain"

### Si tu te surprends à :
- ⚠️ **Regarder le chart en permanence hors NYAM** → ferme TradingView, fais autre chose
- ⚠️ **Vouloir prendre un setup B avec risque A+** → SKIP, la discipline > l'envie
- ⚠️ **Être frustré par une perte** → pause 1h min avant de regarder à nouveau

---

## 📂 DOCUMENTS DE RÉFÉRENCE

| Fichier | Usage |
|---|---|
| `STRATEGIE-V4.0-HYBRIDE.md` | **Ce doc** — ta référence principale |
| `GUIDE-CLT-ETAPES-DETAILLEES.md` | Détails exécution étape par étape |
| `nodex-v2.5-schema.html` | Schéma visuel du pattern |
| `formation-v4.0.html` | **Formation interactive animée** (NOUVEAU) |
| Nodex Journal | Ton app pour logger chaque trade |

---

_Stratégie Nodex V4.0 Hybride · v1.0 · 2026-04-23_
_À valider par 30-50 trades en backtest/paper trading_
_Ne pas partager à l'équipe avant validation complète (cf. memory feedback_no_premature_teaching)_
