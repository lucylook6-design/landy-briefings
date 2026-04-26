#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 产品链接映射表
product_links = {
    # UQD系列产品
    "101541024": {
        "name": "UQD04 Coupling 3/8\" 软管接头 (红色)",
        "series_url": "https://www.cejn.com/products/thermal-control/uqd-couplings/",
        "ocp_url": "https://www.opencompute.org/products/340/cejn-universal-quick-disconnect-uqd",
        "series": "UQD"
    },
    "101541046": {
        "name": "UQD06 Coupling 1/2\" 软管接头 (蓝色)",
        "series_url": "https://www.cejn.com/products/thermal-control/uqd-couplings/",
        "ocp_url": "https://www.opencompute.org/products/340/cejn-universal-quick-disconnect-uqd",
        "series": "UQD"
    },
    "101541028": {
        "name": "UQD08 Coupling 5/8\" 软管接头 (红色)",
        "series_url": "https://www.cejn.com/products/thermal-control/uqd-couplings/",
        "ocp_url": "https://www.opencompute.org/products/340/cejn-universal-quick-disconnect-uqd",
        "series": "UQD"
    },
    "101546674": {
        "name": "UQD04 Nipple UNF 9/16\"-18 公头 (红色)",
        "series_url": "https://www.cejn.com/products/thermal-control/uqd-couplings/",
        "ocp_url": "https://www.opencompute.org/products/340/cejn-universal-quick-disconnect-uqd",
        "series": "UQD"
    },
    "101546696": {
        "name": "UQD06 Nipple UNF 3/4\"-16 公头 (蓝色)",
        "series_url": "https://www.cejn.com/products/thermal-control/uqd-couplings/",
        "ocp_url": "https://www.opencompute.org/products/340/cejn-universal-quick-disconnect-uqd",
        "series": "UQD"
    },
    "101546678": {
        "name": "UQD08 Nipple UNF 7/8\"-14 公头 (红色)",
        "series_url": "https://www.cejn.com/products/thermal-control/uqd-couplings/",
        "ocp_url": "https://www.opencompute.org/products/340/cejn-universal-quick-disconnect-uqd",
        "series": "UQD"
    },
    # UQDB系列产品
    "101531922": {
        "name": "UQDB 02 Coupling UNF 9/16\"-18",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    },
    "101531924": {
        "name": "UQDB 04 Coupling UNF 3/4\"-16",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    },
    "101531926": {
        "name": "UQDB 06 Coupling UNF 7/8\"-14",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    },
    "101531928": {
        "name": "UQDB 08 Coupling UNF 1 1/16\"-12",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    },
    "101536922": {
        "name": "UQDB 02 Nipple UNF 7/16\"-20",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    },
    "101536924": {
        "name": "UQDB 04 Nipple UNF 9/16\"-18",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    },
    "101536926": {
        "name": "UQDB 06 Nipple UNF 3/4\"-16",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    },
    "101536928": {
        "name": "UQDB 08 Nipple UNF 7/8\"-14",
        "series_url": "https://www.cejn.com/products/thermal-control/uqdb-couplings/",
        "ocp_url": "https://www.opencompute.org/products/341/cejn-universal-quick-disconnect-blind-mate-uqdb",
        "series": "UQDB"
    }
}

# 打印产品链接信息
print("产品链接映射表：\n")
for part_no, info in product_links.items():
    print(f"产品编码: {part_no}")
    print(f"  产品名称: {info['name']}")
    print(f"  系列页面: {info['series_url']}")
    print(f"  OCP页面: {info['ocp_url']}")
    print()
